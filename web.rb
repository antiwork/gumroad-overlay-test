require "sinatra"

helpers do
  def data
    {
      development: {
        host: "https://5f56a7a2.ngrok.io",
        products: { i: "Test", t: "Test small PDF" }
      },
      staging: {
        host: "https://staging.gumroad.com",
        products: { aardvark: "Aardvark (subscription)", possum: "Possum (variants)", hedgehog: "Hedgehog (rent/buy)",
                    badger: "Badger (vanilla)", rtsT: "Test image overlays" }
      },
      production: {
        host: "https://gumroad.com",
        products: { bolotie: "Jackalope Bolo Tie", superbutts: "Superbutts", owptA: "Javalope Bolo Tie",
                    wMpzM: "Superbutts", aAGvv: "Test image overlays", "pencil" => "pencil" }
      },
      feature: {
        host: "https://invisible-recaptcha.staging.gumroad.com/",
        products: { i: "Test", t: "Test small PDF" }
      }
    }
  end
end

get "/*" do
  @environment      = (params[:env] || "development").to_sym
  @widget           = (params[:widget] || "overlay").to_sym
  @all_widgets      = %i(overlay embed)
  @all_environments = data.keys
  @data             = data[@environment]
  haml :main
end

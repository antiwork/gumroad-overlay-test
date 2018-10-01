require "sinatra"

helpers do
  def data
    {
      development: {
        host: "https://db10e4f5.ngrok.io",
        products: { m: "Test Test Test" }
      },
      staging: {
        host: "https://staging.gumroad.com",
        products: { aardvark: "Aardvark (subscription)", possum: "Possum (variants)", hedgehog: "Hedgehog (rent/buy)", badger: "Badger (vanilla)",
                    rtsT: "Test image overlays" }
      },
      production: {
        host: "https://gumroad.com",
        products: { bolotie: "Jackalope Bolo Tie", superbutts: "Superbutts", owptA: "Javalope Bolo Tie", wMpzM: "Superbutts", aAGvv: "Test image overlays" }
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

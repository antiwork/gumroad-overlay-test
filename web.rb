require "sinatra"

helpers do
  def data
    {
      development: {
        host: "http://local.host:3000",
        products: { i: "Test", ip: "Subs" }
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

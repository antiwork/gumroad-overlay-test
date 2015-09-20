require "sinatra"

helpers do
  def data
    { development: {
        host: "http://localhost:3333",
        products: {} # Add your products here!
      },
      staging: {
        host: "https://staging.gumroad.com",
        products: { nwfr: "Kyle 1", Yul: "Kyle 2" }
      },
      staging_x: {
        host: "https://staging-x.gumroad.com",
        products: { nM: "test2", Z: "Test physical" }
      },
      production: {
        host: "https://gumroad.com",
        products: { owptA: "Jackalope Bolo Tie", wMpzM: "Superbutts" }
      }
    }
  end
end

get "/*" do
  @environment      = (params[:env] || "development").to_sym
  @widget           = (params[:widget] || "overlay").to_sym
  @all_widgets      = %i(overlay embed overlay_with_cover_photo)
  @all_environments = data.keys
  @data             = data[@environment]
  haml :main
end

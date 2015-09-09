require "sinatra"

helpers do
  def data
    { development: {
        host: "http://localhost:333",
        products: {} # add your products here
      },
      staging: {
        host: "https://staging.gumroad.com",
        products: { hdA: "Hedgehog", usk: "Badger" }
      },
      staging_x: {
        host: "https://staging-x.gumroad.com",
        products: { s: "Test JPG single file", nM: "test2" }
      },
      production: {
        host: "https://gumroad.com",
        products: { owptA: "Jackalope Bolo Tie", wMpzM: "Superbutts" }
      }
    }
  end
end

get "/*" do
  @environment = (params[:env] || "development").to_sym
  @widget = (params[:widget] || "overlay").to_sym
  @all_widgets = %i(overlay) # "embed" doesn't work quite yet
  @all_environments = data.keys
  @data = data[@environment]
  haml :main
end

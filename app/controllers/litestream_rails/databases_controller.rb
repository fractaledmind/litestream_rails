module LitestreamRails
  class DatabasesController < ApplicationController
    around_action :force_english_locale!

    # GET /databases
    def index
      @databases = LitestreamRails.databases
      [{"path"=>"/Users/fractaled/Code/Playgrounds/wrocloverb/storage/production.sqlite3",
        "replicas"=>"s3",
        "generations"=>
         [{"generation"=>"5f4341bc3d22d615",
           "name"=>"s3",
           "lag"=>"3s",
           "start"=>"2024-04-17T19:48:09Z",
           "end"=>"2024-04-17T19:48:09Z",
           "snapshots"=>[{"index"=>"0", "size"=>"4645465", "created"=>"2024-04-17T19:48:09Z"}]},
          {"generation"=>"a184b05a685589f3",
           "name"=>"s3",
           "lag"=>"19h46m52s",
           "start"=>"2024-04-17T00:01:19Z",
           "end"=>"2024-04-17T00:01:19Z",
           "snapshots"=>[{"index"=>"1", "size"=>"4645465", "created"=>"2024-04-17T00:01:19Z"}]}]}]
    end

    private

    def force_english_locale!(&action)
      I18n.with_locale(:en, &action)
    end
  end
end


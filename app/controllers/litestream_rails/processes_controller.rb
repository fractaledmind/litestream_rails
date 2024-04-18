module LitestreamRails
  class ProcessesController < ApplicationController
    # GET /process
    def show
      @process = LitestreamRails.replicate_process
      @databases = LitestreamRails.databases
    end
  end
end
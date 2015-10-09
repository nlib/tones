require_dependency "tones/application_controller"

module Tones
  class TonesController < ApplicationController
    before_action :set_tone, only: [:show, :edit, :update, :destroy]

    # GET /tones
    def index
      @tones = Tone.all
    end

    # GET /tones/1
    def show
    end

    # GET /tones/new
    def new
      @tone = Tone.new
    end

    # GET /tones/1/edit
    def edit
    end

    # POST /tones
    def create
      @tone = Tone.new(tone_params)

      if @tone.save
        redirect_to @tone, notice: 'Tone was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /tones/1
    def update
      if @tone.update(tone_params)
        redirect_to @tone, notice: 'Tone was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /tones/1
    def destroy
      @tone.destroy
      redirect_to tones_url, notice: 'Tone was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tone
        @tone = Tone.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def tone_params
        params.require(:tone).permit(:name, :short, :body, :lang, :description, :de_short, :de_body)
      end
  end
end

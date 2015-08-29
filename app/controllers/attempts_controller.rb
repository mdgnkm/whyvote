class AttemptsController < ApplicationController
  helper 'surveys'

  before_filter :authenticate_user!

  def index
  end

  def show
    @attempt = Attempt.find_by(id: params[:id])
  end

  def new
    @survey = Survey.find_by(id: params[:survey_id])
    @participant = current_user

    unless @survey.nil?
      @attempt = @survey.attempts.new
      @attempt.answers.build
    end
  end

  def create
    @survey = Survey.find_by(id: params[:survey_id])

    unless @survey.nil?
      @attempt = @survey.attempts.new(attempts_params)
      @attempt.participant = current_user

      if @attempt.save
        redirect_to attempt_path(@attempt.id), notice: 'Thank you for answering #{@survey.name}!'
      else
        build_flash(@attempt)
        @participant = current_user
        render :new
      end
    end
  end

  private

  def attempts_params
    if params[:attempt]
      params[:attempt][:answers_attributes] = params[:attempt][:answers_attributes].map { |attrs| { question_id: attrs.first, option_id: attrs.last } }
      params.require(:attempt).permit(Attempt.accessible_attributes)
    end
  end
end
module SurveysHelper
  def get_answer_fields(attempt)
    attempt.survey.questions.order(:id).map { |q| Answer.new(question_id: q.id) }
  end

  def attempt_scope(resource)
    if action_name =~ /new|create/
      attempts_path(resource)
    elsif action_name =~ /edit|update/
      attempt_path(resource)
    end
  end

  def selected?(answer, option)
    if answer.option_id == option.id then 'selected' else '' end
  end
end
class Api::CalculatorController < ApplicationController
  def evaluate
    expression = params[:expression]

    if expression.present?
      number1, operator, number2 = extract_components(expression)

      if number1 && operator && number2
        result = calculate_expression(number1.to_f, operator, number2.to_f)
        render json: { expression: expression, result: result }
      else
        render json: { error: "Invalid expression format" }
      end
    else
      render json: { error: "Invalid expression" }
    end
  end

  private

  def expression_params
    params.require(:expression).permit(:expression)
  end

  def extract_components(expression)
    match = expression.match(/(\d+(?:\.\d+)?)([+\-*\/])(\d+(?:\.\d+)?)/)

    if match
      return match[1], match[2], match[3]
    else
      return nil, nil, nil
    end
  end

  def calculate_expression(number1, operator, number2)
    case operator
    when '+'
      number1 + number2
    when '-'
      number1 - number2
    when '*'
      number1 * number2
    when '/'
      if number2 != 0
        number1 / number2
      else
        "Division by zero is not allowed."
      end
    else
      "Invalid operator"
    end
  end
end

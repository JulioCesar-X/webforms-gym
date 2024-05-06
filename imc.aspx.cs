using System;

namespace webgym
{
    public partial class imc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool TryGetUserInputs(out double peso, out double altura)
        {
            peso = 0;
            altura = 0;


            bool pesoValido = double.TryParse(txtPeso.Text, out peso);
            bool alturaValida = double.TryParse(txtAltura.Text, out altura);

            return pesoValido && alturaValida && peso > 0 && altura > 0;
        }

        private double CalculateIMC(double peso, double altura)
        {
            return peso / (altura * altura);
        }

        private string ClassificarIMC(double imc)
        {
            if (imc < 16) return "Baixo peso muito grave";
            else if (imc >= 16 && imc <= 16.99) return "Baixo peso grave";
            else if (imc >= 17 && imc <= 18.49) return "Baixo peso";
            else if (imc >= 18.50 && imc <= 24.99) return "Peso normal";
            else if (imc >= 25 && imc <= 29.99) return "Sobrepeso";
            else if (imc >= 30 && imc <= 34.99) return "Obesidade grau I";
            else if (imc >= 35 && imc <= 39.99) return "Obesidade grau II";
            else if (imc >= 40) return "Obesidade grau III (obesidade mórbida)";
            else return "Classificação não determinada.";
        }
        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            if (TryGetUserInputs(out double peso, out double altura))
            {
                double imc = CalculateIMC(peso, altura);
                lblResultado.Text = $"Seu IMC é: {imc:0.00}";
                lblResultado.Visible = true;
                lblClassificacao.Text = ClassificarIMC(imc);
                lblClassificacao.Visible = true;
            }
            else
            {
                lblResultado.Text = "Por favor, insira valores válidos para peso e altura.";
                lblResultado.CssClass = "alert alert-danger";
                lblResultado.Visible = true;
                lblClassificacao.Visible = false;
            }

        }

    }
}
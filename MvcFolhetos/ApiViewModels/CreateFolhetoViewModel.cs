using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebAPI.ApiViewModels
{
    /// <summary>
    /// Classe auxiliar de criação dos Folhetos.
    /// 
    /// Ajuda a prevenir contra ataques de "Overposting" / "Mass assignment", e também
    /// permite formulários com campos diferentes da BD.
    /// 
    /// Ver http://www.abhijainsblog.com/2015/04/over-posting-attack-in-mvc.html
    /// /// </summary>
    public class CreateFolhetoViewModel : IValidatableObject
    {
        [StringLength(100)]
        [Required(ErrorMessage = "Tens de preencher o campo {0} , dumb.")]
        public string Titulo { get; set; }

        public string Descricao { get; set; }

        //[FileExtensions(FileTypes = new string[] { "image/png", "image/jpeg", "image/jpg", "image/gif" })]
        //public IEnumerable<HttpPostedFileBase> Files { get; set; }

        [Display(Name = "Data de Inicio")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DataInic { get; set; }

        [Display(Name = "Data Final")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DataFim { get; set; }

        [Display(Name = "Nome da empresa")]
        [Required(ErrorMessage = "Tens de preencher o campo {0} , dumb.")]
        public string NomeEmpresa { get; set; }

        /// <summary>
        /// Validação custom.
        /// 
        /// Atenção: Este método só é chamado pelo MVC/Web API quando as validações
        /// [Required], [StringLength], [RegularExpression], etc.
        /// terminarem todas com sucesso. Se alguma falhar, este método não é chamado.
        /// 
        /// Este método é invocado depois dos campos da classe terem os seus valores preenchidos.
        /// </summary>
        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            //Devo remover isto para depois mais tarde filtrar através do Datepicker(check first)
            if (NomeEmpresa.Equals("IPT", StringComparison.OrdinalIgnoreCase))
            {
                yield return new ValidationResult(
                    "O IPT não é uma loja, é uma instituição de ensino...",
                    new[] { nameof(NomeEmpresa) } // O 'nameof(Variavel)' dá o nome da variável, como string.
                );
            }


            //throw new NotImplementedException();
        }
    }
}
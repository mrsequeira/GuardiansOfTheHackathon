using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebAPI.ApiViewModels
{
    public class CreateTagsViewModel : IValidatableObject
    {
        [StringLength(30)]
        [Required(ErrorMessage = "Tens de preencher o campo {0} , dumb.")]
        public string Info { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            //Devo remover isto para depois mais tarde filtrar através do Datepicker(check first)
            if (Info.Equals("Nao sei", StringComparison.OrdinalIgnoreCase))
            {
                yield return new ValidationResult(
                    "Convém colocar algo que saibas...",
                    new[] { nameof(Info) } // O 'nameof(Variavel)' dá o nome da variável, como string.
                );
            }

        }
    }
}
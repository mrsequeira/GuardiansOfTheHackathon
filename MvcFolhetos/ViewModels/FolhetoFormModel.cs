using MvcFolhetos.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebAPI.ViewModels
{
    public class FolhetoFormModel
    {

        public FolhetoFormModel() { }

        public FolhetoFormModel(Folhetos folhetos)
        {
            this.FolhetoID = folhetos.FolhetosID;
            this.Titulo = folhetos.Titulo;
            this.Descricao = folhetos.Descricao;
            this.DataInic = folhetos.DataInic;
            this.DataFim = folhetos.DataFim;
            this.NomeEmpresa = folhetos.NomeEmpresa;
        }

        public int? FolhetoID { get; set; }
        public string Titulo { get; set; }
        public string Descricao { get; set; }

        [Required, DataType(DataType.Date)]
        public DateTime? DataInic { get; set; }
        [Required, DataType(DataType.Date)]
        public DateTime? DataFim { get; set; }
        public string NomeEmpresa { get; set; }

        #region Dados para dropdowns.

        public IEnumerable<SelectListItem> TagsSelectList { get; set; }
        public IEnumerable<SelectListItem> CategoriasSelectList { get; set; }

        #endregion
    }
}
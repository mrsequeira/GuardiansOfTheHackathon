using MvcFolhetos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebAPI.Controllers
{
    public class DefaultController : ApiController
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        public IHttpActionResult GetFolhetos(string nome)
        {
            if(nome!=null && nome.Length > 10)
            {
                ModelState.AddModelError("nome", "O nome deve ter até 10 caracteres");
                return BadRequest(ModelState);
            }
            // HTTP 200 
            return Ok(db.Folhetos);
        }

    }
}

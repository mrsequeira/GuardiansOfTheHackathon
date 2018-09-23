﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MvcFolhetos.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IdentitySample.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    /// <summary>
    /// classe para efetuar a geração de utilizadores
    /// </summary>
    public class ApplicationUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }

    public class FolhetosDbConnectionString : IdentityDbContext<ApplicationUser>
    {
        public FolhetosDbConnectionString()
            : base("ApplicationDbContext", throwIfV1Schema: false)
        { }

        static FolhetosDbConnectionString()
        {
            // Set the database intializer which is run once during application start
            // This seeds the database with admin user credentials and admin role
            Database.SetInitializer<FolhetosDbConnectionString>(new ApplicationDbInitializer());
        }

        public static FolhetosDbConnectionString Create()
        {
            return new FolhetosDbConnectionString();
        }
        // identificar as tabelas da base de dados
      
        //public virtual DbSet<Folhetos> Folhetos { get; set; }
        //public virtual DbSet<Categorias> Categorias { get; set; }
        //public virtual DbSet<Tags> Tags { get; set; } 
        //public virtual DbSet<Utilizadores> Utilizadores { get; set; }

        //protected override void OnModelCreating(DbModelBuilder modelBuilder) {
        //    modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();  // impede a EF de 'pluralizar' os nomes das tabelas
        //    modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();  // força a que a chave forasteira não tenha a propriedade 'on delete cascade'
        //    modelBuilder.Conventions.Remove<ManyToManyCascadeDeleteConvention>();  // força a que a chave forasteira não tenha a propriedade 'on delete cascade'

        //    base.OnModelCreating(modelBuilder);
        //}
    }
}
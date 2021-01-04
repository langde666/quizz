using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace QuizQpplicationMVC.Models
{
    public class AdminRegister
    {
        [Required]
        [StringLength(100, MinimumLength = 3)]
        public string FullName { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 5)]
        public string Username { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 5)]
        public string Password { get; set; }
        [NotMapped]
        [Required]
        [Compare("Password")]
        public string Confirm { get; set; }
    }
}
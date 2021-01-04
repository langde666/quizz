using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuizQpplicationMVC.Models
{
    public class UserRegister
    {
        [Required]
        [StringLength(100, MinimumLength = 3)]
        public string FullName { get; set; }
    }
}
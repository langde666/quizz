using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuizQpplicationMVC.Models
{
    public class QuestionModel
    {
        [Required]
        public string content { get; set; }
        [Required]
        public string opA { get; set; }
        [Required]
        public string opB { get; set; }
        [Required]
        public string opC { get; set; }
        [Required]
        public string opD { get; set; }
    }
}
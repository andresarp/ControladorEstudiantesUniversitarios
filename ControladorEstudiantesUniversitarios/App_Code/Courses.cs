using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Courses
/// </summary>
public class Courses
{
    public int id { get; set; }
    public string schoolName { get; set; }
    public string courseName { get; set; }
    public string description { get; set; }
    public int price { get; set; }

    public Courses()
    {
    }
}
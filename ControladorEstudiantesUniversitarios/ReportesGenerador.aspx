<%@ Page Title="ReportesGenerador" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ReportesGenerador.aspx.cs" Inherits="ReportesGenerador" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <h1>Generador de reportes</h1>

    <table class="nav-justified" style="height: 404px">
        <tr>
            <td style="width: 360px; height: 260px">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="227px">
                    <asp:ListItem Value="0">Lista de estudiantes matriculados</asp:ListItem>
                    <asp:ListItem Value="1">Lista de cursos matriculados</asp:ListItem>
                    <asp:ListItem Value="2">Total ingresos por matricula</asp:ListItem>
                    <asp:ListItem Value="3">Porcentaje de cursos matriculados</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Height="36px" OnClick="btnSearch_Click" Text="Generar reporte" Width="230px" />
            </td>
            <td rowspan="2">
                <asp:GridView ID="GridViewTotalIngreso" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Height="149px" Width="856px">
                    <Columns>
                        <asp:BoundField DataField="period" HeaderText="period" SortExpression="period" />
                        <asp:BoundField DataField="totalCost" HeaderText="totalCost" ReadOnly="True" SortExpression="totalCost" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT period, SUM(costRegistration) AS totalCost FROM Registration GROUP BY period" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
                <asp:GridView ID="GridViewReportsStudent" runat="server" AutoGenerateColumns="False" DataKeyNames="Identificacion" DataSourceID="SqlDataSource3" Height="270px" Width="860px">
                    <Columns>
                        <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" InsertVisible="False" ReadOnly="True" SortExpression="Identificacion" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido" />
                        <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido" />
                        <asp:BoundField DataField="idCourses" HeaderText="idCourses" SortExpression="idCourses" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Estudiantes.Identificacion, Estudiantes.Nombre, Estudiantes.primerApellido, Estudiantes.segundoApellido, Registration.idCourses FROM Registration INNER JOIN Estudiantes ON Registration.idStudent = Estudiantes.Identificacion CROSS JOIN Courses ORDER BY Registration.idCourses"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idStudent], [idCourses] FROM [Registration] ORDER BY [idCourses]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 360px">&nbsp;</td>
        </tr>
    </table>

    </asp:Content>
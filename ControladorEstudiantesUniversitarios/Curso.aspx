<%@ Page Title="Cursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Curso.aspx.cs" Inherits="Curso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <h1>Control de cursos</h1>
    
    <table class="nav-justified" style="width: 107%; height: 548px; margin-right: 91px">
        <tr>
            <td class="modal-sm" style="width: 201px; height: 20px;"></td>
            <td class="modal-sm" style="width: 160px; height: 20px;"></td>
            <td style="width: 315px; height: 20px;"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td style="width: 315px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 36px;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 160px; height: 36px;">
                &nbsp;</td>
            <td rowspan="7" style="width: 315px">
                <asp:GridView ID="dgViewCourses" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="373px" Width="883px" OnSelectedIndexChanged="dgViewCourses_SelectedIndexChanged" style="margin-left: 35px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="schoolName" HeaderText="Nombre de la escuela" SortExpression="schoolName" />
                        <asp:BoundField DataField="courseName" HeaderText="Nombre del curso" SortExpression="courseName" />
                        <asp:BoundField DataField="description" HeaderText="Descripcion" SortExpression="description" />
                        <asp:BoundField DataField="price" HeaderText="Precio" SortExpression="price" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Courses]" OnSelecting="SqlDataSource1_Selecting">
                </asp:SqlDataSource>
            </td>
            <td style="height: 36px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 36px;">
                <asp:Label ID="lblId" runat="server" Text="Identificación"></asp:Label>
                <asp:TextBox ID="tboxID" runat="server" Width="200px" Enabled="False" OnTextChanged="tboxID_TextChanged"></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 160px; height: 36px;">
                &nbsp;</td>
            <td style="height: 36px"></td>
        </tr>
        <tr>
            <td style="height: 127px; width: 201px">
                <asp:Label ID="lblSchoolName" runat="server" Text="Nombre de la escuela"></asp:Label>
                <asp:TextBox ID="tboxSchoolName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 127px; width: 160px">
                &nbsp;</td>
            <td style="height: 127px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 85px;">
                <asp:Label ID="lblcourseName" runat="server" Text="Nombre del curso"></asp:Label>
                <asp:TextBox ID="tboxCourseName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 160px; height: 85px;">
            </td>
            <td style="height: 85px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 156px;">
                <asp:Label ID="labelSecondName" runat="server" Text="Descripción"></asp:Label>
                <asp:textbox id="textarea" mode="multiline" runat="server" name="S1" Height="88px" Width="200px"/>
            </td>
            <td class="modal-sm" style="width: 160px; height: 156px;">
            </td>
            <td style="height: 156px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 69px">
                <asp:Label ID="lblCost" runat="server" Text="Costo"></asp:Label>
                <asp:TextBox ID="tboxCost" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="height: 69px; width: 160px">
            </td>
            <td style="height: 69px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 78px;">
                <asp:Button ID="btnUpdate" runat="server" OnClick="Button2_Click" Text="Actualizar" Width="76px" />
                <asp:Button ID="btnDelete" runat="server" BackColor="#CC0000" ForeColor="White" Text="Eliminar" OnClick="btnDelete_Click" Width="70px" />
                <asp:Button ID="btnClean" runat="server" BackColor="#66CCFF" ForeColor="Black" OnClick="btnClean_Click" Text="Limpiar" Width="75px" />
                <asp:Button ID="btnAdd" runat="server" BackColor="#339933" ForeColor="White" Text="Agregar" OnClick="btnAdd_Click" Width="73px" Height="25px" />
            </td>
            <td class="modal-sm" style="width: 160px; height: 78px;">
                &nbsp;</td>
            <td style="height: 78px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 20px">&nbsp;</td>
            <td style="height: 20px; width: 160px">
                </td>
            <td style="height: 20px; width: 315px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 42px;"></td>
            <td class="modal-sm" style="width: 160px; height: 42px;"></td>
            <td style="width: 315px; height: 42px;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
            <td style="height: 42px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 49px;"></td>
            <td class="modal-sm" style="width: 160px; height: 49px;"></td>
            <td style="width: 315px; height: 49px;"></td>
            <td style="height: 49px"></td>
        </tr>
    </table>


</asp:Content>

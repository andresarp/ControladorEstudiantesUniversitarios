<%@ Page Title="Matricula" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Matricula.aspx.cs" Inherits="Matricula" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <h1>Matricula estudiantil</h1>

    <table class="nav-justified" style="width: 107%; height: 548px; margin-right: 91px">
        <tr>
            <td class="modal-sm" style="width: 201px; height: 20px;"></td>
            <td class="modal-sm" style="width: 160px; height: 20px;"></td>
            <td style="width: 770px; height: 20px;"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td style="width: 770px">
                <asp:Label ID="lblStudentName" runat="server" Font-Size="25px" ForeColor="#009933"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 36px;">
                &nbsp;</td>
            <td class="modal-sm" style="width: 160px; height: 36px;">
                &nbsp;</td>
            <td rowspan="7" style="width: 770px">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="275px" Width="753px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="idCourse" HeaderText="Id del curso" SortExpression="idCourse" />
                        <asp:BoundField DataField="costCourse" HeaderText="Costo del curso" SortExpression="costCourse" />
                        <asp:BoundField DataField="dateRegistrationCourse" HeaderText="Fecha de matricula" SortExpression="dateRegistrationCourse" />
                        <asp:BoundField DataField="period" HeaderText="Periodo" SortExpression="Periodo" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [TemporalRegistration]"></asp:SqlDataSource>
                <asp:Button ID="btnCancelRegister" runat="server" Height="43px" OnClick="btnCancelRegister_Click" Text="Cancelar matricula" Width="141px" />
                <asp:Button ID="btnEnd" runat="server" BackColor="#0033CC" ForeColor="White" Height="47px" OnClick="btnEnd_Click1" style="margin-top: 0" Text="Finalizar matricula" Width="127px" />
            </td>
            <td style="height: 36px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 36px;">
                <asp:Label ID="lblIdStudent" runat="server" Text="Identificación del estudiante"></asp:Label>
                <asp:TextBox ID="tboxID" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 160px; height: 36px;">
                &nbsp;</td>
            <td style="height: 36px"></td>
        </tr>
        <tr>
            <td style="height: 127px; width: 201px">
                <asp:Label ID="idCourse" runat="server" Text="Identificación del curso"></asp:Label>
                <asp:TextBox ID="tboxIdCourse" runat="server" Height="20px" Width="200px" OnTextChanged="tboxIdCourse_TextChanged"></asp:TextBox>
            </td>
            <td style="height: 127px; width: 160px">
                &nbsp;</td>
            <td style="height: 127px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 85px;">
                <asp:Label ID="lblDate" runat="server" Text="Fecha de matricula"></asp:Label>
                <asp:TextBox ID="tboxDate" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 160px; height: 85px;">
            </td>
            <td style="height: 85px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 156px;">
                <asp:Label ID="labelPeriod" runat="server" Text="Cuatrimestre"></asp:Label>
                <asp:TextBox ID="tboxPeriod" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="modal-sm" style="width: 160px; height: 156px;">
            </td>
            <td style="height: 156px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 69px">
                &nbsp;</td>
            <td style="height: 69px; width: 160px">
            </td>
            <td style="height: 69px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 78px;">
                <asp:Button ID="btnDelete" runat="server" BackColor="#CC0000" ForeColor="White" Text="Eliminar Curso" OnClick="btnDelete_Click" Width="147px" Height="33px" />
                <asp:Button ID="btnAdd" runat="server" BackColor="#339933" ForeColor="White" Text="Agregar curso" OnClick="btnAdd_Click" Width="146px" Height="34px" />
            </td>
            <td class="modal-sm" style="width: 160px; height: 78px;">
                &nbsp;</td>
            <td style="height: 78px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 20px">
                <asp:Button ID="btnClean" runat="server" BackColor="#66CCFF" ForeColor="Black" OnClick="btnClean_Click" Text="Limpiar Campos" Width="146px" Height="32px" />
                </td>
            <td style="height: 20px; width: 160px">
                </td>
            <td style="height: 20px; width: 770px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 42px;"></td>
            <td class="modal-sm" style="width: 160px; height: 42px;"></td>
            <td style="width: 770px; height: 42px;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
            </td>
            <td style="height: 42px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 201px; height: 49px;"></td>
            <td class="modal-sm" style="width: 160px; height: 49px;"></td>
            <td style="width: 770px; height: 49px;"></td>
            <td style="height: 49px"></td>
        </tr>
    </table>

</asp:Content>

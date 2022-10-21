<%@ Page Title="Estudiantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Estudiantes.aspx.cs" Inherits="Estudiantes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <h1>Control de estudiantes</h1>
    
    <table class="nav-justified">
        <tr>
            <td class="modal-sm" style="width: 198px; height: 20px;"></td>
            <td class="modal-sm" style="width: 266px; height: 20px;"></td>
            <td style="width: 315px; height: 20px;"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td style="width: 315px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px">
                <asp:Label ID="lblId" runat="server" Text="Identificación"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 266px">
                <asp:TextBox ID="tboxID" runat="server" Width="176px" Enabled="False"></asp:TextBox>
            </td>
            <td rowspan="7" style="width: 315px">
                <asp:GridView ID="dgViewStudents" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Identificacion" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" InsertVisible="False" ReadOnly="True" SortExpression="Identificacion" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido" />
                        <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido" />
                        <asp:BoundField DataField="fechaNacimiento" HeaderText="fechaNacimiento" SortExpression="fechaNacimiento" />
                        <asp:BoundField DataField="fechaIngreso" HeaderText="fechaIngreso" SortExpression="fechaIngreso" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Estudiantes] WHERE [Identificacion] = @original_Identificacion AND [Nombre] = @original_Nombre AND [primerApellido] = @original_primerApellido AND [segundoApellido] = @original_segundoApellido AND [fechaNacimiento] = @original_fechaNacimiento AND [fechaIngreso] = @original_fechaIngreso" InsertCommand="INSERT INTO [Estudiantes] ([Nombre], [primerApellido], [segundoApellido], [fechaNacimiento], [fechaIngreso]) VALUES (@Nombre, @primerApellido, @segundoApellido, @fechaNacimiento, @fechaIngreso)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Identificacion], [Nombre], [primerApellido], [segundoApellido], [fechaNacimiento], [fechaIngreso] FROM [Estudiantes]" UpdateCommand="UPDATE [Estudiantes] SET [Nombre] = @Nombre, [primerApellido] = @primerApellido, [segundoApellido] = @segundoApellido, [fechaNacimiento] = @fechaNacimiento, [fechaIngreso] = @fechaIngreso WHERE [Identificacion] = @original_Identificacion AND [Nombre] = @original_Nombre AND [primerApellido] = @original_primerApellido AND [segundoApellido] = @original_segundoApellido AND [fechaNacimiento] = @original_fechaNacimiento AND [fechaIngreso] = @original_fechaIngreso">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Identificacion" Type="Int32" />
                        <asp:Parameter Name="original_Nombre" Type="String" />
                        <asp:Parameter Name="original_primerApellido" Type="String" />
                        <asp:Parameter Name="original_segundoApellido" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_fechaNacimiento" />
                        <asp:Parameter DbType="Date" Name="original_fechaIngreso" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="primerApellido" Type="String" />
                        <asp:Parameter Name="segundoApellido" Type="String" />
                        <asp:Parameter DbType="Date" Name="fechaNacimiento" />
                        <asp:Parameter DbType="Date" Name="fechaIngreso" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="primerApellido" Type="String" />
                        <asp:Parameter Name="segundoApellido" Type="String" />
                        <asp:Parameter DbType="Date" Name="fechaNacimiento" />
                        <asp:Parameter DbType="Date" Name="fechaIngreso" />
                        <asp:Parameter Name="original_Identificacion" Type="Int32" />
                        <asp:Parameter Name="original_Nombre" Type="String" />
                        <asp:Parameter Name="original_primerApellido" Type="String" />
                        <asp:Parameter Name="original_segundoApellido" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_fechaNacimiento" />
                        <asp:Parameter DbType="Date" Name="original_fechaIngreso" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px">
                <asp:Label ID="lblName" runat="server" Text="Nombre"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 266px">
                <asp:TextBox ID="tboxName" runat="server" Width="175px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px; width: 198px">
                <asp:Label ID="lblFirstName" runat="server" Text="Primer apellido"></asp:Label>
            </td>
            <td style="height: 20px; width: 266px">
                <asp:TextBox ID="tboxFirstName" runat="server" Width="176px"></asp:TextBox>
            </td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px">
                <asp:Label ID="labelSecondName" runat="server" Text="Segundo apellido"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 266px">
                <asp:TextBox ID="tboxSecondName" runat="server" Width="176px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px">
                <asp:Label ID="lblBirthDate" runat="server" Text="Fecha de nacimiento"></asp:Label>
            </td>
            <td class="modal-sm" style="width: 266px">
                <asp:TextBox ID="tboxBirthDate" runat="server" Width="176px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px; height: 20px">
                <asp:Label ID="lblAdmissionDate" runat="server" Text="Fecha de ingreso"></asp:Label>
            </td>
            <td style="height: 20px; width: 266px">
                <asp:TextBox ID="tboxAdmissionDate" runat="server" Width="176px"></asp:TextBox>
            </td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px">&nbsp;</td>
            <td class="modal-sm" style="width: 266px">
                <asp:Button ID="btnUpdate" runat="server" OnClick="Button2_Click" Text="Actualizar" />
                <asp:Button ID="btnDelete" runat="server" BackColor="#CC0000" ForeColor="White" Text="Eliminar" OnClick="btnDelete_Click" />
                <asp:Button ID="btnClean" runat="server" BackColor="#66CCFF" ForeColor="Black" OnClick="btnClean_Click" Text="Limpiar" Width="75px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px; height: 20px">&nbsp;</td>
            <td style="height: 20px; width: 266px">
                <asp:Button ID="btnAdd" runat="server" BackColor="#339933" ForeColor="White" Text="Agregar" OnClick="btnAdd_Click" Width="241px" />
                </td>
            <td style="height: 20px; width: 315px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px">&nbsp;</td>
            <td class="modal-sm" style="width: 266px">&nbsp;</td>
            <td style="width: 315px">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 198px">&nbsp;</td>
            <td class="modal-sm" style="width: 266px">&nbsp;</td>
            <td style="width: 315px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>


</asp:Content>
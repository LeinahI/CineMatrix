<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admndirmgmt.aspx.cs" Inherits="FilmMS.admnauthmgmt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        //admndirmgmt table start
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "bProcessing": true,
                pageLength: 0,
                lengthMenu: [
                    [5, 7, -1],
                    [5, 7, "All"]
                ],
                responsive: true,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records"
                },
                "targets": 'no-sort',
                "bSort": false,

            });
        });
        //admndirmgmt table end
    </script>
    <style>
        .primary-clr {
            background-color: #a30262;
            color: white;
        }

            .primary-clr:hover {
                background-color: #B55690;
                color: white;
            }

        .secondary-clr {
            background-color: #FF9A56;
            color: white;
        }

            .secondary-clr:hover {
                background-color: #EF7627;
                color: white;
            }

        .accent-clr {
            background-color: #D162A4;
            color: white;
        }

            .accent-clr:hover {
                background-color: #B55690;
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container mb-5 mt-5">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Director Details</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/imgs/writer.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group form-floating">
                                        <asp:TextBox CssClass="form-control" ID="admndir_dirIDtbx" placeholder="Director ID" runat="server" TextMode="Number"></asp:TextBox>
                                        <label for="memfnametbx">Director ID</label>
                                        <asp:LinkButton class="btn btn-primary d-flex align-items-center" ID="admndir_searchbtn" runat="server"
                                            OnClick="admndir_searchbtn_Click">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admndir_dirnametbx" placeholder="an" runat="server"></asp:TextBox>
                                    <label for="memdobtbx">Director Name</label>
                                </div>
                            </div>
                        </div>


                        <div class="row mt-4">

                            <div class=" btn-group">

                                <asp:Button ID="admndir_add" class="btn btn-lg btn-block primary-clr" runat="server" Text="Add" OnClick="admndir_add_Click" />
                                <asp:Button ID="admndir_update" class="btn btn-lg btn-block accent-clr text-light" runat="server" Text="Update" OnClick="admndir_update_Click" />
                                <asp:Button ID="admndir_delete" class="btn btn-lg btn-block secondary-clr" runat="server" Text="Delete" OnClick="admndir_delete_Click" />

                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <div class="col ">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Director List</h4>

                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ 
                                    ConnectionStrings:efilmlibDBConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:efilmlibDBConnectionString.ProviderName %>"
                                    SelectCommand="SELECT * FROM [director_master_tbl]" />
                                <div class="col">
                                    <asp:GridView class="table table-stripped table-bordered" ID="admndir_GridView" 
                                        runat="server" AutoGenerateColumns="False" DataKeyNames="director_id" 
                                        DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="director_id" HeaderText="Director ID" InsertVisible="False" ReadOnly="True" SortExpression="director_id" />
                                            <asp:BoundField DataField="director_name" HeaderText="Director Full Name" SortExpression="director_name" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <br />
    <br />
</asp:Content>

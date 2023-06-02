<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admnfilmissuing.aspx.cs" Inherits="FilmMS.admnbookissuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        //admndirmgmt table start
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "bProcessing": true,
                pageLength: 0,
                lengthMenu: [
                    [3, 7, -1],
                    [3, 7, "All"]
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
    <div class="container-fluid mb-5 mt-5">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Film Issuing</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/imgs/books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnfilmissue_memidtbx" placeholder="Member ID" runat="server"></asp:TextBox>
                                    <label for="memidtbx">Member ID</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group form-floating">
                                        <asp:TextBox CssClass="form-control" ID="admnfilmissue_filmidtbx" placeholder="Film ID" runat="server"></asp:TextBox>
                                        <label for="filmidtbx">Film ID</label>
                                        <asp:LinkButton class="btn btn-primary d-flex align-items-center" ID="admnfilmissue_searchbtn" OnClick="admnfilmissue_searchbtn_Click" runat="server">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4">

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnfilmissue_memnametbx" placeholder="Member ID" runat="server" ReadOnly="True"></asp:TextBox>
                                    <label for="memnametbx">Member Full Name</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnfilmissue_filmnametbx" placeholder="Film Name" runat="server" ReadOnly="True"></asp:TextBox>
                                    <label for="filmnametbx">Film Name</label>
                                </div>
                            </div>


                        </div>

                        <div class="row mt-4">

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnfilmissue_startdatetbx" placeholder="Start Date"
                                        runat="server" TextMode="Date"></asp:TextBox>
                                    <label for="startdatetbx">Start Date</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnfilmissue_enddatetbx" placeholder="End Date"
                                        runat="server" TextMode="Date"></asp:TextBox>
                                    <label for="enddatetbx">End Date</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4">

                            <div class=" btn-group">

                                <asp:Button ID="admnfilmissue_issue" class="btn btn-lg btn-block primary-clr" runat="server" Text="Issue" OnClick="admnfilmissue_issue_Click" />
                                <asp:Button ID="admnfilmissue_return" class="btn btn-lg btn-block secondary-clr text-light" runat="server" Text="Return" OnClick="admnfilmissue_return_Click" />

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
                                        <h4>Issued Film List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="admnfilmissue_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:efilmlibDBConnectionString %>" SelectCommand="SELECT * FROM [film_issue_tbl]" />
                                <div class="col">
                                    <asp:GridView class="table table-stripped table-bordered" ID="admnfilmissue_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="admnfilmissue_SqlDataSource" OnRowDataBound="admnfilmissue_GridView_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                            <asp:BoundField DataField="member_fullname" HeaderText="Member Name" SortExpression="member_fullname" />
                                            <asp:BoundField DataField="film_id" HeaderText="Film ID" SortExpression="film_id" />
                                            <asp:BoundField DataField="film_name" HeaderText="Film Name" SortExpression="film_name" />
                                            <asp:TemplateField HeaderText="Issue Date">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("issue_date", "{0:MMMM, dd yyyy}") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="due_date" HeaderText="Due Date" ApplyFormatInEditMode="true" DataFormatString="{0:d}" SortExpression="due_date" />
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

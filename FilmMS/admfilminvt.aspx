<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admfilminvt.aspx.cs" Inherits="FilmMS.admnbookinvt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
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

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#<%=imgview.ClientID%>').prop('src', e.target.result)
                        .width(100)
                        .height(150);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

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
                                    <h3>Film Details</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <asp:Image CssClass="img-thumbnail" ID="imgview" Width="100px" Height="150px" runat="server" src="film_cover_invt/placeholder.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this);" ID="admnflminvt_imgFileUpload" class="form-control " runat="server" />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group form-floating">
                                        <asp:TextBox CssClass="form-control" ID="admnflminvt_filmidtbx" placeholder="Film ID" runat="server"></asp:TextBox>
                                        <label for="filmidtbx">Film ID</label>
                                        <asp:LinkButton class="btn btn-primary d-flex align-items-center" ID="admnflminvt_searchbtn" runat="server" OnClick="admnflminvt_searchbtn_Click">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_fntbx" placeholder="Film Name" runat="server"></asp:TextBox>
                                    <label for="fntbx">Film Name</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-2">

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:DropDownList CssClass="form-control" ID="admnflminvt_director" placeholder="ddl" runat="server">
                                        <asp:ListItem Text="d1" Value="d1" />
                                        <asp:ListItem Text="d2" Value="d2" />
                                    </asp:DropDownList>
                                    <label for="authnm">Director Name</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:DropDownList CssClass="form-control" ID="admnflminvt_production" placeholder="prod" runat="server">
                                        <asp:ListItem Text="p1" Value="p1" />
                                        <asp:ListItem Text="p2" Value="p2" />
                                    </asp:DropDownList>
                                    <label for="prod">Production Company (studio)</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-2">

                            <div class="col-md-12">
                                <div class="form-group form-floating">
                                    <%--<asp:TextBox CssClass="form-control" ID="admnflminvt_genres" placeholder="genre" runat="server"></asp:TextBox>--%>
                                    <asp:ListBox CssClass="form-control" ID="admnflminvt_genretbx" placeholder="genres"
                                        SelectionMode="Multiple" Height="100px" Rows="5" runat="server">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Animation" Value="Animation" />
                                        <asp:ListItem Text="Comedy" Value="Comedy" />
                                        <asp:ListItem Text="Motivation" Value="Crime" />
                                        <asp:ListItem Text="Documentary" Value="Documentary" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Family" Value="Family" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Music" Value="Music" />
                                        <asp:ListItem Text="Mystery" Value="Mystery" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="TV Movie" Value="TV Movie" />
                                        <asp:ListItem Text="War" Value="War" />
                                        <asp:ListItem Text="Western" Value="Western" />
                                    </asp:ListBox>
                                    <label for="genres">Genres</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-2">

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_lang" placeholder="lang" runat="server"></asp:TextBox>
                                    <label for="lang">Language</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_reldt" placeholder="pubdt" runat="server" TextMode="Date"></asp:TextBox>
                                    <label for="pubdate">Release Date</label>
                                </div>
                            </div>

                        </div>


                        <div class="row mt-2">

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_filmcost" placeholder="bookcost" runat="server" TextMode="Number"></asp:TextBox>
                                    <label for="bookcost">Film Cost (rent cost)</label>
                                </div>

                            </div>

                            <div class="col-md-6">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_filmlength" placeholder="genre" TextMode="Number" runat="server"></asp:TextBox>
                                    <label for="pages">Film Length</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-2">

                            <div class="col-md-4">
                                <div class="form-group mt-2 form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_actstock" placeholder="actstock" runat="server" TextMode="Number"></asp:TextBox>
                                    <label for="actstock">Actual Stock</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group mt-2 form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_curstock" placeholder="currstock" runat="server" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                    <label for="currstock">Current stock</label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group mt-2 form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_issuedfilms" placeholder="issuedfilms" runat="server" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                    <label for="issuedfilms">Issued Films (rented films)</label>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="admnflminvt_desc" placeholder="fulladdr" runat="server"></asp:TextBox>
                                    <label for="memctnumtbx">Description</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class=" btn-group">
                                <asp:Button ID="admnflminvt_add" class="btn btn-lg btn-block primary-clr" runat="server" Text="Add" OnClick="admnflminvt_add_Click" />
                                <asp:Button ID="admnflminvt_update" class="btn btn-lg btn-block accent-clr text-light" runat="server" Text="Update" OnClick="admnflminvt_update_Click" />
                                <asp:Button ID="admnflminvt_delete" class="btn btn-lg btn-block secondary-clr" runat="server" Text="Delete" OnClick="admnflminvt_delete_Click" />
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <div class="col">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Book Inventory List</h4>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <div class="row">
                                <asp:SqlDataSource ID="admnflminvt_SqlDataSource" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:efilmlibDBConnectionString %>"
                                    SelectCommand="SELECT * FROM [film_master_tbl]" />
                                <div class="col">
                                    <asp:GridView class="table table-stripped table-bordered" AutoGenerateColumns="False" ID="admnflminvt_GridView" runat="server" DataSourceID="admnflminvt_SqlDataSource">
                                        <Columns>
                                            <asp:BoundField DataField="film_id" HeaderText="Film ID" InsertVisible="False" ReadOnly="True" SortExpression="film_id" />


                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <%-- All details from database --%>
                                                            <div class="col-lg-10">

                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="admnflminvt_filmNamedb" runat="server" Text='<%# Eval("film_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Director -
                                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("director_name") %>'></asp:Label>
                                                                        &nbsp;| Genre -
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                        &nbsp;| Language -
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>

                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Studio -
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("production_company_name") %>'></asp:Label>
                                                                        &nbsp;| Release date -
                                                                        <asp:Label ID="admnflminvt_reldatedb" runat="server" Font-Bold="True" Text='<%# Eval("release_date", "{0:MMMM/dd/yyyy}") %>'></asp:Label>
                                                                        &nbsp;| length -
                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("film_length_min") %>'></asp:Label>
                                                                        min
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Rent cost - ₱<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("film_cost","{0:0.00}") %>'></asp:Label>
                                                                        &nbsp;| Actual stock -
                                                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                        &nbsp;| Available -
                                                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <br />
                                                                        <span class="fw-bold">Description</span> -
                                                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("film_description") %>'></asp:Label>

                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <%-- Image link --%>
                                                            <div class="col-lg-2">
                                                                <center>
                                                                    <asp:Image CssClass="img-thumbnail p-2" Height="200" Width="150" ID="admnflminvt_imglinkdb" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                                </center>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>


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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="FilmMS.userloginaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            background-color: #ff9a56;
            color: white;
        }

        .secondary-txt-clr {
            color: #D52D00;
        }

            .secondary-txt-clr:hover {
                color: #ff9a56;
            }

        .accent-clr {
            background-color: #d162a4;
            color: white;
        }

        .vignette {
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container mb-5 mt-5">
        <div class="row">
            <div class="col-md-5 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Log in</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group form-floating">
                                    <asp:TextBox CssClass="form-control" ID="usrlg_memidtbx" required="required" placeholder="un" runat="server"></asp:TextBox>
                                    <label for="usrlg_memidtbx">Username</label>
                                </div>

                                <div class="form-group form-floating mt-4">
                                    <asp:TextBox CssClass="form-control" ID="usrlg_mempwtbx" required="required" placeholder="pw" runat="server" TextMode="Password"></asp:TextBox>
                                    <label for="usrlg_mempwtbx">Password</label>
                                </div>

                                <div class="form-group mt-4 d-grid">
                                    <asp:Button class="btn primary-clr" ID="usrlg_loginbtn" runat="server" Text="Log in" OnClick="usrlg_loginbtn_Click" />
                                </div>

                                <div class="form-group mt-4">
                                    <center>
                                        <p class="text-secondary">
                                            Don't have account yet? 
                                            <a href="usersignup.aspx" class="link-dark text-decoration-none secondary-txt-clr fw-bold">Register now</a>
                                        </p>
                                    </center>
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

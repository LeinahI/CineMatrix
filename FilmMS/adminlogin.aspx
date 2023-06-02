<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="FilmMS.adminlogin" %>

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

        .accent-clr {
            background-color: #d162a4;
            color: white;
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
                                    <img width="150px" src="images/imgs/adminuser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Log in</h3>
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
                                    <asp:TextBox CssClass="form-control" ID="admnlg_admnunametbx" placeholder="un" runat="server"></asp:TextBox>
                                    <label for="admnlg_admnunametbx">Admin Username</label>
                                </div>

                                <div class="form-group form-floating mt-4">
                                    <asp:TextBox CssClass="form-control" ID="admnlg_admnpwtbx" placeholder="pw" runat="server" TextMode="Password"></asp:TextBox>
                                    <label for="admnlg_admnpwtbx">Admin Password</label>
                                </div>

                                <div class="form-group mt-4 d-grid">
                                    <asp:Button class="btn primary-clr" ID="admnlg_loginbtn" runat="server" Text="Log in" OnClick="admnlg_loginbtn_Click" />
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

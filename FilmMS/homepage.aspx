<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="FilmMS.homepage" %>

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

        .vignette {
            position: relative;
        }

        .title {
            position: absolute;
            top: 35%;
            width: 100%;
            text-align: center;
        }
        body{
            user-select: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron">
        <div class="vignette">
            <img src="images/imgs/homepage_bg.jpg" width="100%" height="811px" />
        </div>
        <div class="title container-fluid">
            <div class="row">
                <div class="col-12">
                    <center>
                        <img src="images/imgs/title_cinematrix.png" height="200" width="500" />
                        <p class="fs-3 text-light">
                            A TONS OF Collection OF <b>LOCAL AND INTERNATIONAL FILMS</b>
                            <br />
                            TO WATCH IMMEDIATELY IN YOUR AREA
                        </p>
                        <asp:Button ID="homepage_drflm" CssClass="btn btn-block primary-clr" runat="server" Text="Discover Films" OnClick="homepage_drflm_Click" />
                    </center>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

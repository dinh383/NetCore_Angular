using Microsoft.EntityFrameworkCore.Migrations;

namespace App.Data.EF.Migrations
{
    public partial class ChannelYouTubeIdU : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ChannelYouTubeId",
                table: "Resource.Channel",
                maxLength: 200,
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ChannelYouTubeId",
                table: "Resource.Channel");
        }
    }
}

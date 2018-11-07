using Microsoft.EntityFrameworkCore.Migrations;

namespace App.Data.EF.Migrations
{
    public partial class CategoryIdConvertToInt : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "VideoID",
                table: "Resource.Video",
                maxLength: 200,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 50);

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "Resource.Video",
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 30,
                oldNullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "VideoID",
                table: "Resource.Video",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 200);

            migrationBuilder.AlterColumn<string>(
                name: "CategoryId",
                table: "Resource.Video",
                maxLength: 30,
                nullable: true,
                oldClrType: typeof(int));
        }
    }
}

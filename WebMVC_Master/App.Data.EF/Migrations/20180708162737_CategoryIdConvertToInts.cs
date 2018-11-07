using Microsoft.EntityFrameworkCore.Migrations;

namespace App.Data.EF.Migrations
{
    public partial class CategoryIdConvertToInts : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "Resource.Video",
                nullable: true,
                oldClrType: typeof(int));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "Resource.Video",
                nullable: false,
                oldClrType: typeof(int),
                oldNullable: true);
        }
    }
}

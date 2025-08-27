using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//======================
 // הזרקות--------------------------------------------------

builder.Services.AddScoped<IDal_Repository.IProductDal, Dal_Repository.ProductDal>();
builder.Services.AddScoped<IBll_Services.IProductBll, Bll_Services.ProductBll>();

builder.Services.AddScoped<IDal_Repository.ICategoryDal, Dal_Repository.CategoryDal>();
builder.Services.AddScoped<IBll_Services.ICategoryBll, Bll_Services.CategoryBll>();

builder.Services.AddScoped<IDal_Repository.ICustomerDal, Dal_Repository.CustomerDal>();
builder.Services.AddScoped<IBll_Services.ICustomerBll, Bll_Services.CustomerBll>();

builder.Services.AddScoped<IDal_Repository.IOrderDal, Dal_Repository.OrderDal>();
builder.Services.AddScoped<IBll_Services.IOrderBll, Bll_Services.OrderBll>();


//הוצאת פרטי המסד לקובץ חיצוני 
builder.Services.AddDbContext<Dal_Repository.models.StoreContext>
(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("StoreConnection")));
//======================
//הרשאת גישה לכולם
builder.Services.AddCors(a => a.AddPolicy("AllowAll", b => b.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod()));
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("AllowAll");

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

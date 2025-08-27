
namespace IBll_Services
{
    public interface IBllService<T>
    {
        Task<List<T>> GetAll();
        //ישנם כמה ממשקים שממשים ממשק זה ועתיד יוכלו גם השאר לממש
    }
}


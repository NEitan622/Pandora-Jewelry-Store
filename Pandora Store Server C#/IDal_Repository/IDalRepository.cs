namespace IDal_Repository
{
    public interface IDalRepository<T>
    {
        public Task<List<T>> GetAll();
       
    }
}

import '../db/base_api_db.dart';
import '../models/book.dart';
import 'book_interface.dart';

class BookRepository implements IBookRepository {
  final VirtualDB _db;

  BookRepository(this._db);

  @override
  Future<List<Book>> getAll() async {
    var items = await _db.list();
    return items.map((item) => Book.fromJson(item)).toList();
  }

  @override
  Future<Book?> getOne(int id) async {
    var item = await _db.findOne(id);
    return item != null ? Book.fromJson(item) : null;
  }

  @override
  Future<void> insert(Book book) async {
    await _db.insert(book.toJson());
  }

  @override
  Future<void> update(Book book) async {
    await _db.update(book.toJson());
  }

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }
}

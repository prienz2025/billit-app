import '../models/payment.dart';
import 'base_repository.dart';

class PaymentRepository implements BaseRepository<Payment> {
  @override
  Future<Payment> get(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Payment(
      id: id,
      userId: 'test-user-id',
      rentalId: 'test-rental-id',
      amount: 5000,
      method: PaymentMethod.card,
      status: PaymentStatus.completed,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<List<Payment>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Payment(
        id: 'payment-1',
        userId: 'test-user-id',
        rentalId: 'rental-1',
        amount: 5000,
        method: PaymentMethod.card,
        status: PaymentStatus.completed,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Payment(
        id: 'payment-2',
        userId: 'test-user-id',
        rentalId: 'rental-2',
        amount: 7000,
        method: PaymentMethod.card,
        status: PaymentStatus.completed,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  @override
  Future<Payment> create(Payment payment) async {
    await Future.delayed(const Duration(seconds: 1));
    return payment;
  }

  @override
  Future<Payment> update(Payment payment) async {
    await Future.delayed(const Duration(seconds: 1));
    return payment;
  }

  @override
  Future<void> delete(String id) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<List<Payment>> getByUser(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Payment(
        id: 'payment-1',
        userId: userId,
        rentalId: 'rental-1',
        amount: 5000,
        method: PaymentMethod.card,
        status: PaymentStatus.completed,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Payment(
        id: 'payment-2',
        userId: userId,
        rentalId: 'rental-2',
        amount: 7000,
        method: PaymentMethod.card,
        status: PaymentStatus.completed,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  Future<Payment> processPayment(
      String userId, String rentalId, int amount) async {
    await Future.delayed(const Duration(seconds: 2)); // 결제 처리 시뮬레이션
    return Payment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      rentalId: rentalId,
      amount: amount,
      method: PaymentMethod.card,
      status: PaymentStatus.completed,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/prest_theme.dart';
import 'store/offer_details_store.dart';
import 'widgets/offer_gallery.dart';

class OfferDetailsScreen extends ConsumerStatefulWidget {
  final String id;
  // Додаємо initialOffer, який приходить з GoRouter extra
  final OfferModel? initialOffer;

  const OfferDetailsScreen({
    super.key,
    required this.id,
    this.initialOffer,
  });

  @override
  ConsumerState<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends ConsumerState<OfferDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Викликаємо завантаження тільки якщо у нас немає готового об'єкта
    // Або якщо ми хочемо оновити дані в фоні
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialOffer == null) {
        ref.read(offerDetailsProvider(widget.id).notifier).loadOffer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(offerDetailsProvider(widget.id));
    final theme = context.prestTheme;

    // Пріоритет: 1. Дані зі стору (якщо вже завантажені) 2. Переданий об'єкт initialOffer
    final OfferModel? effectiveOffer = state.maybeWhen(
      loaded: (offer) => offer,
      orElse: () => widget.initialOffer,
    );

    // Якщо даних немає ні в сторі, ні в extra — показуємо лоадер
    if (effectiveOffer == null && state is! OfferDetailsStateError) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator(color: Colors.black)),
      );
    }

    // Якщо сталася помилка і даних немає
    if (state is OfferDetailsStateError && effectiveOffer == null) {
      return Scaffold(
        body: Center(child: Text('Error loading data', style: theme.blackTextTheme.font5)),
      );
    }

    // Основний контент (тут effectiveOffer гарантовано не null)
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          effectiveOffer!.portalTitle?.toUpperCase() ?? 'DETAILS',
          style: theme.blackTextTheme.font6.copyWith(letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Галерея (якщо є картинки)
            if (effectiveOffer.pictures != null && effectiveOffer.pictures!.isNotEmpty)
              OfferGallery(images: effectiveOffer.pictures!),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PROPERTY DETAILS',
                    style: theme.goldTextTheme.font7.copyWith(letterSpacing: 4),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    effectiveOffer.portalTitle ?? 'No Title',
                    style: theme.blackTextTheme.font1,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '${effectiveOffer.price ?? '---'} PLN',
                    style: theme.blackTextTheme.font2.copyWith(color: theme.colors.gold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Divider(color: Colors.black12),
                  ),

                  // Опис
                  Text(
                    'DESCRIPTION',
                    style: theme.blackTextTheme.font5.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    effectiveOffer.description ?? 'No description provided.',
                    style: theme.grayTextTheme.font6.copyWith(height: 1.6),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
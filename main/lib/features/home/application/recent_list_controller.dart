import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:models/entities/recent_list/recent_list_entity.dart';

class RecentListController extends StateNotifier<List<RecentListEntity>?> {
  RecentListController(this.ref) : super(null);
  final Ref ref;

  Future getRecentList() async {
    Utils.showLoading();

    final getRecentListResponse =
        await ref.read(homeRespositoryProvider).getRecentList();

    getRecentListResponse.fold((l) {}, (r) {
      state = r.results;
    });

    Utils.hideLoading();
  }

  void reState() {
    state = [...?state];
  }
}

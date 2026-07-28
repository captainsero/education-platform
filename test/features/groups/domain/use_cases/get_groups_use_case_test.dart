import 'package:education_platform/config/base_response/base_response.dart';
import 'package:education_platform/core/errors/app_error.dart';
import 'package:education_platform/features/groups/domain/entities/group_entity.dart';
import 'package:education_platform/features/groups/domain/repo/groups_repo_contract.dart';
import 'package:education_platform/features/groups/domain/use_cases/get_groups_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_groups_use_case_test.mocks.dart';

@GenerateMocks([GroupsRepoContract])
void main() {
  late GetGroupsUseCase useCase;
  late MockGroupsRepoContract mockRepo;

  setUp(() {
    // Provide a dummy value so Mockito can handle the sealed BaseResponse type.
    provideDummy<BaseResponse<List<GroupEntity>>>(
      const SuccessBaseResponse<List<GroupEntity>>(data: <GroupEntity>[]),
    );

    mockRepo = MockGroupsRepoContract();
    useCase = GetGroupsUseCase(repoContract: mockRepo);
  });

  group('GetGroupsUseCase', () {
    final tGroups = [
      GroupEntity(
        id: 'group-1',
        name: 'Math 101',
        schedules: [],
        studentCount: 25,
      ),
      GroupEntity(
        id: 'group-2',
        name: 'Physics 201',
        schedules: [],
        studentCount: 10,
      ),
    ];

    test(
      'should return SuccessBaseResponse<List<GroupEntity>> '
      'when the repository call succeeds',
      () async {
        // arrange
        when(mockRepo.getGroups()).thenAnswer(
          (_) async => SuccessBaseResponse<List<GroupEntity>>(data: tGroups),
        );

        // act
        final result = await useCase();

        // assert
        expect(result, isA<SuccessBaseResponse<List<GroupEntity>>>());
        final success = result as SuccessBaseResponse<List<GroupEntity>>;
        expect(success.data, tGroups);
        expect(success.data.length, 2);
        verify(mockRepo.getGroups()).called(1);
        verifyNoMoreInteractions(mockRepo);
      },
    );

    test(
      'should return ErrorBaseResponse '
      'when the repository call fails',
      () async {
        // arrange
        when(mockRepo.getGroups()).thenAnswer(
          (_) async => const ErrorBaseResponse<List<GroupEntity>>(
            error: UnknownError(),
          ),
        );

        // act
        final result = await useCase();

        // assert
        expect(result, isA<ErrorBaseResponse<List<GroupEntity>>>());
        final error = result as ErrorBaseResponse<List<GroupEntity>>;
        expect(error.error, isA<UnknownError>());
        verify(mockRepo.getGroups()).called(1);
        verifyNoMoreInteractions(mockRepo);
      },
    );

    test(
      'should return SuccessBaseResponse with empty list '
      'when the repository returns no groups',
      () async {
        // arrange
        when(mockRepo.getGroups()).thenAnswer(
          (_) async => const SuccessBaseResponse<List<GroupEntity>>(
            data: <GroupEntity>[],
          ),
        );

        // act
        final result = await useCase();

        // assert
        expect(result, isA<SuccessBaseResponse<List<GroupEntity>>>());
        final success = result as SuccessBaseResponse<List<GroupEntity>>;
        expect(success.data, isEmpty);
        verify(mockRepo.getGroups()).called(1);
      },
    );
  });
}

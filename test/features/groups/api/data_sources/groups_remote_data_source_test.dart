import 'package:education_platform/config/base_response/base_response.dart';
import 'package:education_platform/features/groups/data/data_sources/groups_remote_data_source_contract.dart';
import 'package:education_platform/features/groups/data/models/group_model.dart';
import 'package:education_platform/features/groups/data/models/schedule_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'groups_remote_data_source_test.mocks.dart';

@GenerateMocks([GroupsRemoteDataSourceContract])
void main() {
  late MockGroupsRemoteDataSourceContract mockDataSource;

  setUp(() {
    provideDummy<BaseResponse<List<GroupModel>>>(
      const SuccessBaseResponse<List<GroupModel>>(data: <GroupModel>[]),
    );

    mockDataSource = MockGroupsRemoteDataSourceContract();
  });

  group('GroupsRemoteDataSource - getGroups', () {
    final tGroups = [
      GroupModel(
        id: 'group-1',
        teacherId: 'teacher-1',
        name: 'Math 101',
        timezone: 'Africa/Cairo',
        isActive: true,
        createdAt: DateTime.parse('2026-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2026-01-01T00:00:00Z'),
        schedules: [
          ScheduleModel(
            id: 'schedule-1',
            groupId: 'group-1',
            dayOfWeek: 0,
            startTime: '16:00:00',
            endTime: '17:00:00',
          ),
        ],
        studentCount: 25,
      ),
      GroupModel(
        id: 'group-2',
        teacherId: 'teacher-1',
        name: 'Physics 201',
        timezone: 'Africa/Cairo',
        isActive: true,
        createdAt: DateTime.parse('2026-02-01T00:00:00Z'),
        updatedAt: DateTime.parse('2026-02-01T00:00:00Z'),
        schedules: [],
        studentCount: 0,
      ),
    ];

    test(
      'should return SuccessBaseResponse when supabase call succeeds',
      () async {
        // Arrange
        when(mockDataSource.getGroups()).thenAnswer(
          (_) async => SuccessBaseResponse<List<GroupModel>>(data: tGroups),
        );

        // Act
        final result = await mockDataSource.getGroups();

        // Assert
        expect(result, isA<SuccessBaseResponse<List<GroupModel>>>());

        final success = result as SuccessBaseResponse<List<GroupModel>>;

        expect(success.data.length, 2);
        expect(success.data[0].id, 'group-1');
        expect(success.data[0].name, 'Math 101');
        expect(success.data[0].studentCount, 25);
        expect(success.data[0].schedules.length, 1);
        expect(success.data[1].id, 'group-2');
        expect(success.data[1].name, 'Physics 201');
        expect(success.data[1].studentCount, 0);
        expect(success.data[1].schedules, isEmpty);

        verify(mockDataSource.getGroups()).called(1);

        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test('should return SuccessBaseResponse with empty list '
        'when supabase returns no rows', () async {
      // Arrange
      when(mockDataSource.getGroups()).thenAnswer(
        (_) async =>
            const SuccessBaseResponse<List<GroupModel>>(data: <GroupModel>[]),
      );

      // Act
      final result = await mockDataSource.getGroups();

      // Assert
      expect(result, isA<SuccessBaseResponse<List<GroupModel>>>());

      final success = result as SuccessBaseResponse<List<GroupModel>>;

      expect(success.data, isEmpty);

      verify(mockDataSource.getGroups()).called(1);

      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return ErrorBaseResponse when supabase call throws', () async {
      // Arrange
      final exception = Exception('Something went wrong');

      when(mockDataSource.getGroups()).thenAnswer(
        (_) async => ErrorBaseResponse<List<GroupModel>>(error: exception),
      );

      // Act
      final result = await mockDataSource.getGroups();

      // Assert
      expect(result, isA<ErrorBaseResponse<List<GroupModel>>>());

      final failure = result as ErrorBaseResponse<List<GroupModel>>;

      expect(failure.error, exception);

      verify(mockDataSource.getGroups()).called(1);

      verifyNoMoreInteractions(mockDataSource);
    });
  });
}

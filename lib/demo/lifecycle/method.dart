class Mothed {
  Mothed({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

final List<Mothed> motheds = [
  Mothed(
      title: 'initState()：Widget',
      description:
          '初始化当前 State，在当前方法中是不能获取到 Context 的，如想获取，可以试试 Future.delayed()'),
  Mothed(
      title: 'didChangeDependencies()',
      description: '在 initState() 后调用，State对象依赖关系发生变化的时候也会调用。'),
  Mothed(
      title: 'deactivate()',
      description:
          '当 State 被暂时从视图树中移除时会调用这个方法，页面切换时也会调用该方法，和Android里的 onPause 差不多。'),
  Mothed(
      title: 'dispose()',
      description: 'Widget 销毁时调用。'),
  Mothed(
      title: 'didUpdateWidget',
      description: 'Widget 状态发生变化的时候调用。')
];

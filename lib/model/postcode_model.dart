class PostcodeModel {
  String location, postOffice, state;
  int postcode;

  PostcodeModel(
      {required this.location,
      required this.postOffice,
      required this.postcode,
      required this.state});

  PostcodeModel.fromList(List<dynamic> items)
      : this(
          location: items[1],
          postOffice: items[2],
          postcode: items[3],
          state: items[4],
        );

  @override
  String toString() {
    return 'PostcodeModel{location: $location, postOffice: $postOffice, postcode: $postcode, state: $state';
  }
}

// Thanks to https://stackoverflow.com/a/60080464/13617136
CuteOrBoot.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    // this needs to be collection of filtered users, rather than whole index
    // index can even be the feed
    // on vote, removeModel from collection,
    // remove subviews where necessary
    this.users = options.users;
  },

  routes: {
    "": "game",
    "cuties/:id": "showUser",
    "2": "two",
    "3": "three",
    "4": "four"
  },

  // LOAD TIME IS SLOW, deal with this fetching
  game: function () {
    this.users.fetch();

    var user = this.users.first();

    var dashboardView = new CuteOrBoot.Views.UserDashboard({
      model: user,
      collection: this.users
    });

    this._swapView(dashboardView);
  },

  showUser: function (id) {
    this.users.fetch();

    var user = new CuteOrBoot.Models.User({ id: id });
    user.fetch();

    var dashboardView = new CuteOrBoot.Views.UserDashboard({
      model: user,
      collection: this.users
    });

    this._swapView(dashboardView);
  },

  two: function () {
    console.log("two");
  },

  three: function () {
    console.log("three");
  },

  four: function () {
    console.log("four");
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
});

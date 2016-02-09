/**
 * Disclaimer: This fragment of code forms part of a code challenge,
 * it follows INTENTIONALLY bad practices, that you need to identify and fix.
 *
 * Tasks:
 *
 * - 1. Refactor and improve the unit tests on the functionality.
 * - 2. Refactor the original code.
 * - 3. You can switch to your preferred unit testing FW(even write your own).
 *
 * @see https://github.com/spotify/jsconfeu-2013
 */

var Spotify = Spotify || {};

// made up of 3 things: 1. org namespace ('spotify')
// 2. entity type (track, app, playlist)
// 3. some identifier

var lettersRegex = /^[a-zA-Z]+$/ // bluenote
var lettersAndNumbersRegex = /^[a-zA-Z0-9]+$/ // 5t8ANYm2ToLpjV7AxJ1U1N
var typeNames = {
  'track': lettersAndNumbersRegex,
  'playlist': lettersAndNumbersRegex,
  'app': lettersRegex,
}

var parseEntity = function (string) {
  var arr = string.split(':')

  return {
    orgName: arr[0],
    typeName: arr[1],
    ID: arr[2],
  }
}

var validateOrgName = function (orgName) {
  return orgName === 'spotify'
}

var validateTypeName = function (typeName) {
  return typeName in typeNames
}

var validateID = function (ID, validatedTypeName) {
  return typeNames[validatedTypeName].test(ID)
}

var validateEntity = function (entityString, specificType) {
  var parsedEntity = parseEntity(entityString)
  if (specificType && specificType !== parsedEntity.typeName) {
    return false
  }
  return (
    validateOrgName(parsedEntity.orgName) &&
    validateTypeName(parsedEntity.typeName) &&
    validateID(parsedEntity.ID, parsedEntity.typeName)
  )
}


Spotify.Entity = {
    isApp: function(spotifyUri) {
        // e.g. spotify:app:bluenote
        return validateEntity(spotifyUri, 'app')
    },
    isTrack: function(spotifyUri) {
        // e.g. spotify:track:5t8ANYm2ToLpjV7AxJ1U1N
        return validateEntity(spotifyUri, 'track')
    },
    isPlaylist: function(spotifyUri) {
        // e.g. spotify:playlist:6J9kgSvipjimfDLYTsCOAv
        return validateEntity(spotifyUri, 'playlist')
    },
    isEntity: function(spotifyUri) {
        return validateEntity(spotifyUri)
    },
    // entities_array e.g. ['spotify:app:test1', 'spotify:playlist:asdf']
    process: function(entities_array, callback) {
      entities_array.filter(validateEntity).forEach(callback)
    }
};

// Example of unit test FW(you can change it and use a custom unit testing FW)
var myUnitTesting = {

    _passed: 0,

    _failed: 0,

    _result: 'Tests running: ',

    assert: function(statement, id) {
        if (statement) {
            this._passed++;
            this._result += '.';
        } else {
            this._failed++;
            this._result += 'F';
        }
    },

    showResults: function() {
        console.log(this._result);
        console.log(this._passed + ' tests passed, ' + this._failed + ' failed');
    }
};

(function() {

    myUnitTesting.assert(Spotify.Entity.isApp('spotify:app:bluenote'));
    myUnitTesting.assert(Spotify.Entity.isTrack('spotify:track:asdf555'));
    myUnitTesting.assert(Spotify.Entity.isPlaylist('spotify:playlist:asdf555'));
    myUnitTesting.assert(Spotify.Entity.isEntity('spotify:app:bluenote'));
    myUnitTesting.assert(!Spotify.Entity.isEntity('spotify:random:bluenote'));



    // Spotify.Entity.process
    var counter = 0;

    Spotify.Entity.process(['spotify:app:test1', 'spotify:undefined:asdf55'], function(params) {
        counter++;
    });

    myUnitTesting.assert(counter === 0);

    // Show results
    myUnitTesting.showResults();

})();

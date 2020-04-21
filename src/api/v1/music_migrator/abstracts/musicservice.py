from abc import ABC, abstractmethod

class MusicServiceAbstract(ABC):
 
    def __init__(self, playlistManager):
        self.playlistManager = playlistManager
        super().__init__()
    
    @abstractmethod
    def authenticate(self):
        return self

    @abstractmethod
    def logout(self):
        return self

    def getAuthenticationUrl(self):
        return self.authenticationUrl

    def setAuthenticationUrl(self, url):
        self.authenticationUrl = url
        return self

    def getRedirectUrl(self):
        return self.redirectUrl

    def setRedirectUrl(self, url):
        self.redirectUrl = url
        return self

    def getToken(self):
        return self.token

    def setToken(self, token):
        self.token = url
        return self

    def getPlaylistManager(self):
        if not hasattr(self, 'token'):
            raise ValueError('Token is not set, please authenticate music service before managing playlists.')
        return self.playlistManager


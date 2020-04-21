from abc import ABC, abstractmethod

class PlaylistManagerAbstract(ABC):
 
    def __init__(self):
        self.isAuthenticated = bool(0)
        super().__init__()
    
    @abstractmethod
    def getAllPlaylists(self):
        self.checkAuthentication()
        return self

    @abstractmethod
    def createPlaylist(self, name, description=None, public=False):
        self.checkAuthentication()
        return self

    @abstractmethod
    def editPlaylist(self, playlist_id, new_name=None, new_description=None, public=None):
        self.checkAuthentication()
        return self

    @abstractmethod
    def addSongsToPlaylist(self, playlist_id, song_ids):
        self.checkAuthentication()
        return self

    def getIsAuthenticated(self):
        return self.isAuthenticated

    def setIsAuthenticated(self, authenticated):
        self.isAuthenticated = authenticated
        return self
    
    def checkAuthentication(self):
        if not self.getIsAuthenticated():
            raise ValueError('Token is not set, please authenticate music service before managing playlists.')
        pass

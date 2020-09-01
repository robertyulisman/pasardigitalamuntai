import React, {useState} from 'react';
import {View, Text, Image, Dimensions} from 'react-native';
import HTML from 'react-native-render-html';
import YouTube from 'react-native-youtube';
import {WebView} from 'react-native-webview';

const {width, height} = Dimensions.get('window');

const PromoContent = ({image, judul, tanggal, konten, videoId, html}) => {
  const [isReady, setIsReady] = useState(false);

  return (
    <View>
      <View
        style={{
          height: 200,
          width: '100%',
          marginLeft: 10,
          padding: 10,
        }}
        v>
        <Image
          style={{
            height: undefined,
            width: undefined,
            resizeMode: 'cover',
            flex: 1,
          }}
          source={image}
        />
      </View>
      <Text style={{marginTop: 10}}>{judul}</Text>
      <Text style={{marginTop: 10, marginBottom: 10}}>{tanggal}</Text>
      {/* <HTML html={konten} /> */}
      <View>
        <WebView
          style={{margin: 10, height: height, width: width}}
          // source={konten}
          javaScriptEnabled={true}
          domStorageEnabled={true}
          // html={{html: `<p>test image disini</p>`}}
          html={'<p>Here I am</p>'}
        />
      </View>

      <YouTube
        videoId={videoId} // The YouTube video ID
        apiKey="AIzaSyAd9ya3WDPfljn5Avrpi8d2iAvZdYfGmZE"
        hidden={false}
        playsInline={true}
        play // control playback of video with true/false
        //   fullscreen // control whether the video should play in fullscreen or inline
        loop // control whether the video should loop when ended
        onReady={e => setIsReady(true)}
        // onChangeState={e => this.setState({status: e.state})}
        // onChangeQuality={e => this.setState({quality: e.quality})}
        onError={e => console.log('error', e)}
        style={{alignSelf: 'stretch', height: 250}}
      />
    </View>
  );
};

export default PromoContent;

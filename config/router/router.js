import {createAppContainer, createSwitchNavigator} from 'react-navigation';
import {createStackNavigator} from 'react-navigation-stack';
import HomePage from '../../src/page/HomePage';
import Konsultasi from '../../src/page/Konsultasi';
import Produk from '../../src/page/Produk';
import DetailProduct from '../../src/page/DetailProduct';
import Promo from '../../src/page/Promo';
import Sosmed from '../../src/page/Sosmed';
import Tentang from '../../src/page/Tentang';
import InfoDetail from '../../src/page/InfoDetail';

const HomeStack = createStackNavigator(
  {
    HomePage,
    Konsultasi,
    Produk,
    Promo,
    Sosmed,
    Tentang,
    DetailProduct,
    InfoDetail,
  },
  {
    headerMode: 'none',
    initialRouteName: 'HomePage',
  },
);

const Router = createSwitchNavigator(
  {
    HomeStack,
  },
  {
    headerMode: 'none',
    initialRouteName: 'HomeStack',
  },
);

export default createAppContainer(Router);

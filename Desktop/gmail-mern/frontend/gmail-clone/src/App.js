import './App.css';
import Body from './components/Body';
import Header from './components/Header';
import SendMail from './components/SendMail';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import TestAPI from './components/TestAPI';

function App() {
  return (
    <div className="app">
    {/* <TestAPI/> */}
      <Header/>
      <Body/>
      <Router>
        <Route path="/sendMail">
          <SendMail/>
        </Route>
      </Router>
    </div>
  );
}

export default App;

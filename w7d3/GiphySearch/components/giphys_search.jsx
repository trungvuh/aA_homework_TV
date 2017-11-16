import React from 'react';

import { GiphysIndex } from './giphys_index';

class GiphysSearch extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ searchTerm: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
    this.setState({ searchTerm: ""});
  }

  render () {
    let { giphys } = this.props;
    return(
      <div>
        <form>
          <input
            value={this.state.searchTerm}
            onChange={this.handleChange}
            placeholder="Type your search here"/>

          <button
            type="submit"
            onClick={this.handleSubmit}>
            Search Giphys
          </button>
        </form>
        <GiphysIndex giphys={giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;

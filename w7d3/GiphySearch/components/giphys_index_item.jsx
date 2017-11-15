import { GiphysIndex } from './giphys_index';

import React from 'react';

export const GiphysIndexItem = ({ giphy }) => {
  return (
    <li>
      <img src={giphy.images.fixed_height.url} />
    </li>
  );
};

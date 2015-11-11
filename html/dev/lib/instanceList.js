import React from 'react';
import R from 'ramda';

const InstanceInfo = ({ getWorkInfo, getTypeInfo, workIndex, wordIndex, url }) => {
  const workInfo = getWorkInfo(workIndex);
  const wordInfo = workInfo.wordInfos[wordIndex];
  const wordValues = wordInfo.v;
  const wordContextIndex = wordInfo.c;
  const wordProperties = (R.map) (v => getTypeInfo(v[0]).values[v[1]].t) (wordValues);
  const wordExtraElements = R.addIndex(R.map) ((x, i) => <span key={i} className="instanceInfo"> &mdash; {x}</span>) (wordProperties.slice(1));
  return (
    <div>
      <a href={url}>{wordProperties[0]}</a>
      <span className="instanceInfo"> &mdash; {workInfo.title} &mdash; {workInfo.source}</span>
      {wordExtraElements}
    </div>
  );
};

export const InstanceList = ({ getWorkInfo, getTypeInfo, instances, typeIndex, valueIndex, getWordDetailUrl }) => {
  const getWorkIndex = x => x[0];
  const getWordIndex = x => x[1];
  return (
    <div className="listContainer">
      {R.addIndex(R.map) ((x, i) => (
        <InstanceInfo
          key={typeIndex + '.' + valueIndex + '.' + i}
          getWorkInfo={getWorkInfo}
          getTypeInfo={getTypeInfo}
          workIndex={getWorkIndex(x)}
          wordIndex={getWordIndex(x)}
          url={getWordDetailUrl(typeIndex, i)}
        />
      )) (instances)}
    </div>
  );
};

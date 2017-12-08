#include <raft>
#include <opencv2/imgproc/types_c.h>
#include <RaftOCV/utility/Metadata.h>
#include <RaftOCV/utility/FunctorFilter.h>

class ConvertColorFunctor {
    int16_t ConversionType;
public:
    ConvertColorFunctor(int16_t ConversionType);
    MetadataEnvelope<cv::Mat> operator()(const MetadataEnvelope<cv::Mat>& in);
};

typedef FunctorFilter<ConvertColorFunctor> ConvertColorFilter;

